import * as React from 'react'

const greeting = "Greetings from React!";

class HelloWorld extends React.Component {
  render () {
    return (
      <div>
          <strong><p><u>{greeting}</u></p></strong>
      </div>
    );
  }
}

export default HelloWorld;
