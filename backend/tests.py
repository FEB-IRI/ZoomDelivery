import unittest
from app import app, User, Order, db, create_tables, drop_tables

class TestFlaskApp(unittest.TestCase):
    """
    Test the flask app.
    """

    def setUp(self):
        """
        Set up the test environment.
        """
        app.config['TESTING'] = True
        app.config['WTF_CSRF_ENABLED'] = False
        app.config['DEBUG'] = False
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///test.db'
        app.config['SECRET_KEY'] = 'test_secret_key'
        self.app = app.test_client()
        drop_tables(app, db)
        create_tables(app, db)
        

    def tearDown(self):
        """
        Tear down the test environment.
        """
        db.session.remove()
        drop_tables(app, db)

    def test_index(self):
        """
        Test that the index page loads.
        """
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)

    def test_register(self):
        """
        Test that the register page loads and that a user can be registered.
        """
        response = self.app.post('/register', json={'username': 'test', 
                                                    'email': 'test@test.com', 
                                                    'password': 'test', 
                                                    'confirm_password': 'test', 
                                                    'school': 'test'})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json['success'], True)

    def test_login(self):
        """
        Test that the login page loads and that a user can log in.
        """
        response = self.app.post('/register', json={'username': 'test', 
                                                    'email': 'test@test.com', 
                                                    'password': 'test', 
                                                    'confirm_password': 'test', 
                                                    'school': 'test'})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json['success'], True)
        response = self.app.post('/login', json={'email': 'test@test.com', 
                                                 'password': 'test'})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json['success'], True)

    def test_logout(self):
        """
        Test that the logout page loads and that a user can log out.
        """
        response = self.app.post('/register', json={'username': 'test', 
                                                    'email': 'test@test.com', 
                                                    'password': 'test', 
                                                    'confirm_password': 'test', 
                                                    'school': 'test'})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json['success'], True)
        response = self.app.post('/login', json={'email': 'test@test.com', 
                                                 'password': 'test'})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json['success'], True)
        response = self.app.get('/logout')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json['success'], True)

    def test_order(self):
        """
        Test that the order page loads and that a user can create an order.
        """
        response = self.app.post('/register', json={'username': 'test', 
                                                    'email': 'test@test.com', 
                                                    'password': 'test', 
                                                    'confirm_password': 'test', 
                                                    'school': 'test'})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json['success'], True)
        response = self.app.post('/login', json={'email': 'test@test.com', 
                                                 'password': 'test'})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json['success'], True)
        response = self.app.post('/orders', json={'description': 'test', 
                                                 'items': 'test', 
                                                 'location': 'test', 
                                                 'destination': 'test'})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json['success'], True)

if __name__ == '__main__':
    unittest.main()
