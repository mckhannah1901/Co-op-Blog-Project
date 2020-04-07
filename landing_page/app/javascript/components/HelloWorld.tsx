import * as React from 'react'

type MyProps = {
    greeting:string
}

class HelloWorld extends React.Component<MyProps> {
    render (){
        return (
            <div className="HelloWorld">
                <strong><p><u>{this.props.greeting}</u></p></strong>
            </div>
        );
    }
}

export default HelloWorld;
