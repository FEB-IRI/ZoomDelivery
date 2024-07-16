#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
This is the backend of the Zoom Delivery application. It consists of two main components:
1. Flask API: This is the main API that handles user registration, login, and order management.
2. SQLite database: This is used to store user information and order details.

The API is designed to be RESTful and uses HTTP methods to perform CRUD operations. The
following endpoints are available:

1. POST /register: Register a new user.
2. POST /login: Login a user.
3. GET /orders: Get all orders for the logged-in user.
4. POST /orders: Create a new order for the logged-in user.
5. GET /logout: Logout the logged-in user.

The API uses Flask-Login for user authentication and Flask-SQLAlchemy for database operations.
The database is SQLite and contains two tables: User and Order.

"""

import os
from flask import Flask, request
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager, UserMixin, login_user, logout_user, current_user
from werkzeug.security import generate_password_hash, check_password_hash


app = Flask(__name__)
app.secret_key = os.getenv('SECRET_KEY')
app.config['SESSION_TYPE'] = 'filesystem'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///zoomdelivery.db'
db = SQLAlchemy(app)
login_manager = LoginManager(app)


class User(db.Model, UserMixin):
    """
    User model for storing user information.
    """
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(150), unique=True, nullable=False)
    school = db.Column(db.String(150), nullable=False)
    email = db.Column(db.String(150), unique=True, nullable=False)
    password = db.Column(db.String(150), nullable=False)
    order = db.relationship('Order', backref='author', lazy=True)


class Order(db.Model):
    """
    Order model for storing order details.
    """
    id = db.Column(db.Integer, primary_key=True)
    description = db.Column(db.Text, nullable=True)
    items = db.Column(db.String(150), nullable=False)
    location = db.Column(db.String(150), nullable=False)
    destination = db.Column(db.String(150), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)


@login_manager.user_loader
def load_user(user_id):
    """
    Load the user object from the database based on the user ID.
    """
    return User.query.get(int(user_id))


@app.route('/register', methods=['POST'])
def register():
    """
    Register a new user.
    """
    if request.method == 'POST' and request.data:
        data = request.get_json()
        if set(data.keys()) == {'username', 'email', 'password', 'confirm_password', 'school'}:
            existing_user = User.query.filter_by(username=data['username']).first()
            if existing_user:
                return {'success': False, 'msg': 'Username already exists'}
            elif data['password'] != data['confirm_password']:
                return {'success': False, 'msg': 'Passwords do not match'}
            else:
                hashed_password = generate_password_hash(data['password'])
                user = User(username=data['username'],
                            email=data['email'], password=hashed_password, school=data['school'])
                db.session.add(user)
                db.session.commit()
                return {'success': True, 'msg': 'User created successfully'}


@app.route('/login', methods=['POST'])
def login():
    """
    Login a user.
    """
    if request.method == 'POST' and request.data:
        data = request.get_json()
        if set(data.keys()) == {'email', 'password'}:
            user = User.query.filter_by(email=data['email']).first()
            if user and check_password_hash(user.password, data['password']):
                login_user(user)
                return {'success': True, 'msg': 'Login successful'}
            else:
                return {'success': False, 'msg': 'Invalid email or password'}


@app.route('/orders', methods=['GET', 'POST'])
def orders():
    """
    Get all orders for the logged-in user or create a new order.
    """
    if request.method == 'GET':
        orders = Order.query.filter_by(user_id=current_user.id).all()
        return {'success': True, 'orders': orders}

    if request.method == 'POST' and request.data:
        data = request.get_json()
        if set(data.keys()) == {'description', 'items', 'location', 'destination'}:
            order = Order(description=data['description'],
                          items=data['items'], location=data['location'],
                          destination=data['destination'], user_id=current_user.id)
            db.session.add(order)
            db.session.commit()
            return {'success': True, 'msg': 'Order created successfully'}


@app.route('/logout')
def logout():
    """
    Logout the logged-in user.
    """
    logout_user()
    return {'success': True, 'msg': 'Logout successful'}


def create_tables(appp, dbb):
    """Create database tables"""
    with appp.app_context():
        dbb.create_all()

def drop_tables(appp, dbb):
    """Drop database tables"""
    with appp.app_context():
        dbb.drop_all()

if __name__ == '__main__':
    create_tables(app, db)
    app.run(host='0.0.0.0', port=5000)
