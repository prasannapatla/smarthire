
import React from 'react';
import { Link } from 'react-router-dom';
import logo from '../assets/terralogo.svg';

var page = function (_this: any) {
    return (
        <div className="Login">
            <div className="bg"></div><br /><br />
            <div className="banner">
                <h2 className='header'>Smarthire</h2>
            </div>

            <div className="login-reg-panel">
                <div className="white-panel"><br />
                    <a  href="https://www.terralogic.com/">
                        <img src={logo} alt="Terralogic" className="avatar" />
                    </a>
                    <form id="log_form" >
                        <div className="login-show">
                            <input type="text" placeholder="Email" id="lemail" required />
                            <input type="password" placeholder="Password" id="lpwd" required />
                            <input type="button" onClick={_this.login_user.bind(_this)} value="Login" />

                            <div id="invalidprompt"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    )
}
export default page;
    