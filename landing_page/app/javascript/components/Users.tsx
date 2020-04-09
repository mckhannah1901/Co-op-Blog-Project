import React from 'react';
import CSS from 'csstype';

type UsersProps = {
    title:string
    userInfoType:string
    userDetails:string
}

const h1Styles: CSS.Properties = {
    padding: '1.0rem',
    fontFamily: 'sans-serif'
};

const h6Styles: CSS.Properties = {
    fontFamily: 'sans-serif',
    color: 'lime'
};

class Users extends React.Component<UsersProps> {
    render (){
        return (
            <div className="Users">
                <h1 style={h1Styles}>{this.props.title}</h1>
                <h6 style={h6Styles}>{this.props.userInfoType}</h6>
                <p>{this.props.userDetails}</p>
            </div>
        );
    }
}

export default Users;
