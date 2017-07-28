from flask import Flask, render_template

app = Flask(__name__)

@app.route('/hello')
def hello_world():
    return render_template('hello.html', name="Joel")

@app.route('/user/<username>/<age>')
def show_user_profile(username, age):
    user_dictionary = { "name": username, "age": int(age) }
    # return user to template
    # show the user profile for that user
    return render_template('hello.html', user = user_dictionary)


































# from flask import render_template
# return render_template('hello.html')



# @app.route('/user/<username>')
# def show_user_profile(username):
#     # show the user profile for that user
#     return 'User %s' % username
# return render_template('hello.html', name=name)




# {% if name %}
#   <h1>Hello {{ name }}!</h1>
# {% else %}
#   <h1>Hello, World!</h1>
# {% endif %}