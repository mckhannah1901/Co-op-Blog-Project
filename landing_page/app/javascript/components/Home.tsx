import React from 'react';
import CSS from 'csstype';

type HomeProps = {
    title:string
    content:string
};

const h1Styles: CSS.Properties = {
    padding: '1.0rem',
    fontFamily: 'sans-serif'
};

const h3Styles: CSS.Properties = {
    fontFamily: 'sans-serif',
    color: 'lime'
};

class Home extends React.Component<HomeProps> {
    render (){
        return (
            <div className="Home">
                <h1 style={h1Styles}>{this.props.title}</h1>
                <h3 style={h3Styles}>{this.props.content}</h3>
            </div>
        );
    }
}

export default Home;
