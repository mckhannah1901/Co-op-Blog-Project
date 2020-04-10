import React from 'react';
import CSS from 'csstype';

type MicropostsProps = {
    title:string
    micropostInfoType:string
    micropostDetails:string
};

const h1Styles: CSS.Properties = {
    padding: '1.0rem',
    fontFamily: 'sans-serif'
};

const h6Styles: CSS.Properties = {
    fontFamily: 'sans-serif',
    color: 'lime'
};

class Microposts extends React.Component<MicropostsProps> {
    render (){
        return (
            <div className="Microposts">
                <h1 style={h1Styles}>{this.props.title}</h1>
                <h6 style={h6Styles}>{this.props.micropostInfoType}</h6>
                <p>{this.props.micropostDetails}</p>
            </div>
        );
    }
}

export default Microposts;
