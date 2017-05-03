import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

function myFunc(){
	return 1;
}

const user = {
	name: 'myName',
};

class App extends Component {
  render() {
    return (
      <div className="App">
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Welcome to React</h2>
        </div>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
		<p>
		Test environment variable {process.env.NODE_ENV}
		</p>
		<p>
		Test function {myFunc()}
		</p>
		<p>
		Test object {user.name}
		</p>
      </div>
    );
  }
}

export default App;
