
import React from 'react';
import { Link } from 'react-router-dom';

var page = function (_this: any) {
    return (
        <div className="Design2">
            <div className="bg"></div>
            <div className="container-fluid">
                <div className="row">
                    <div className="col-sm-6" >
                        <div className="col_container">
                            .col-sm-3
                        </div>
                    </div>
                    <div className="col-sm-6" >
                        <div className="col_container">
                            <div className="white-panel">
                                <div style={{ position: "relative" }} >
                                    <div className="svg-style2">
                                        <svg width="400" height="550" >
                                            <polygon className="svg-form" points="0,0 325,0 400,75 400,550 0,550 0,0" />
                                            <polygon className="svg-form-fold" points="325,0 400,75 325,75 325,0" style={{ stroke: "grey", strokeWidth: "0.5", fill: "#F6F7FB", fillRule: "evenodd" }} />
                                            Sorry, your browser does not support inline SVG.
                                        </svg>
                                    </div>
                                </div>
                                <div className="login-form">
                                    <form>
                                        <h2 className="login-text">Lgin</h2>
                                        <p className="details">Enter your details to start.</p>
                                        <div className="inputs">
                                            <p className="details">E-mail</p>
                                            <input type="text" placeholder="Email" id="lemail" required />
                                            <p className="details">Password</p>
                                            <input type="password" placeholder="Password" id="lpwd" required />
                                            <a className="forgot-pwd" style={{ color: "#E7537F" }}>Forgot Password?</a>
                                        </div>
                                        <input className="btn_style" type="button" onClick={_this.login_user.bind(_this)} value="Login" />
                                            <div id="invalidprompt"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default page;
