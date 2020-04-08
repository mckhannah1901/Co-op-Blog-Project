import * as React from 'react'

type HelloWorldProps = {
    greeting:string
}

class HelloWorld extends React.Component<HelloWorldProps> {
    render (){
        return (
            <div className="HelloWorld">
                <strong><p><u>{this.props.greeting}</u></p></strong>
            </div>
        );
    }
}

export default HelloWorld;
