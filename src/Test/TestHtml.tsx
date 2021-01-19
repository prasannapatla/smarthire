
import React from 'react';
import { Link } from 'react-router-dom';
import emoji from '../assets/output-onlinepngtools.png'

var page = function (_this: any) {

    let mystyle = {
        width: "360px",
        height: "120px",
        background: "url('" + emoji + "')",
        backgroundPosition: "center center",
        backgroundSize: "cover",
        backgroundColor: "red"

    }
    return (
        
        <div className="Test">
            <h1 className="wel">Welcome</h1>
            <h2>Test</h2><br />
            <Link to='/'>App</Link><br />
            <Link to='/routes'>links</Link><br />
           
            <input type="button" value="test"  ref={_this.btn} onClick={_this.test} /><br />
            <div className="test" style={mystyle}>  </div>
        </div>
    )
}
export default page;
