
import React from 'react';
import { Link } from 'react-router-dom';

var page = function (_this: any) {
   return (
      <div className="Vishdesign">
         <div className="loginBg"></div>
         <div className="container-fluid">
            <div className="row">
               {/* Text space */}
               <div className="col-sm-6" >
                  <div className="col_container">
                     <div className="logo">
                        <p>Space for logo</p>
                     </div>
                  </div>
                  <div className="description">
                     <p className="greetings">Welcome<br/>to <b>Smarthire</b> </p>
                     <br/> 
                     <p className="info">A hiring platform for talent teams of<br/> companies to assist in evaluating <br/>candidates</p>                           
                  </div>
               </div>
               
               {/* login space */}
               <div className="col-sm-6" >
                  <div className="col_container">
                     <div className="rightTopContainer">
                        <div className="loginForm">
                           <svg width="350" height="520" className="svg_bg">
                              <polygon className="svgForm" points="0,0 275,0 350,60 350,520 0,520 0,0"  />
                              <polygon className="svgFormFold"  points="275,0 350,60 275,60" />
                              Sorry, your browser does not support inline SVG.
                           </svg>
                           <div className="form">
                              <div className="formDetails">
                                 <h3 className="loginText">Login</h3>
                                 <p className="detailsText">Enter your details to start.</p>
                                 <p className="detailsText">E-mail</p>
                                 <input type="text" placeholder="Email" id="lemail" required />
                                 <p className="detailsText">Password</p>
                                 <input type="password" placeholder="Password" id="lpwd" required />
                                 <a className="forgot-pwd" style={{color:"#E7537F"}}>Forgot Password?</a><br /><br />
                                 <input className="btn_style" type="button" onClick={_this.login_user.bind(_this)} value="Login" />
                                 <div id="invalidprompt"></div>
                              </div>
                           </div>
                           <div className="formBottom">
                                    
                              </div>
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
