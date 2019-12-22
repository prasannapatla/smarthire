
import React from 'react';
import { Link } from 'react-router-dom';
import logo from '../assets/terralogo.svg';
import { relative } from 'path';

var page = function (_this: any) {
    return (
        <div className="Design1">
            <div className="bg"></div><br /><br />
            <div className="banner">
            </div>
            <div className="white-panel">
                <div style={{ position: "relative" }} >
                    <div className="svg-style2">
                        <svg width="500" height="670" >
                            <polygon className="svg-form" points="0,0 425,0 500,75 500,670 0,670 0,0"  />
                            <polygon className="svg-form-fold"  points="425,0 500,75 425,75 425,0" style={{ stroke:"grey", strokeWidth:"0.5", fill: "#F6F7FB", fillRule: "evenodd" }} />
                            Sorry, your browser does not support inline SVG.
                        </svg>
                    </div>
                </div>
                <div className="login-form">
                    <form>
                        <h2 className="login-text">Login</h2>
                        <p className="details">Enter your details to start.</p>
                        <div>
                            <p className="details">E-mail</p>
                            <input type="text" placeholder="Email" id="lemail" required />
                            <p className="details">Password</p>
                            <input type="password" placeholder="Password" id="lpwd" required />
                            <a className="forgot-pwd" style={{color:"#E7537F"}}>Forgot Password?</a><br /><br />
                            <input className="btn_style" type="button" onClick={_this.login_user.bind(_this)} value="Login" />
                            <div id="invalidprompt"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    )
}
export default page;
