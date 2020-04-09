import React from 'react';
import CSS from 'csstype';

type SessionsProps = {
    title:string
};

const h1Styles: CSS.Properties = {
    padding: '1.0rem',
    fontFamily: 'sans-serif'
};

class Sessions extends React.Component<SessionsProps> {
    render (){
        return (
            <div className="Sessions">
                <h1 style={h1Styles}>{this.props.title}</h1>
            </div>
        );
    }
}

export default Sessions;
