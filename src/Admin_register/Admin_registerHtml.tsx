
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';
import { FaPlus } from 'react-icons/fa';
var $ = require("jquery");

var page = function (_this: any) {
    return (
        <div className="Admin_register">
            <div className="container">
                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        {/* <Banner /> */}
                        <div className="data">
                            <div className="sect">
                                <form style={{ fontSize: "15px;" }}>
                                    <div style={{ marginBottom: "10px" }}>
                                        <div className='heading'>Register Candidate</div>
                                        <select id="cur_exam" className="cur_exam" style={{ marginTop: "21px", marginBottom: "21px" }}></select>
                                        <button className="register" onClick={_this.register_user.bind(_this)}><b style={{ marginRight: "5px" }}><FaPlus style={{ color: "#FFFFFF" }} /> Register</b></button>
                                        <input type="text" placeholder="Name" className="form-control rname" required />
                                        <input type="text" placeholder="Email" className="form-control remail" required />
                                        <input type="tel" placeholder="Mobile number" maxLength={10} className="form-control mob" required />

                                    </div>
                                </form>
                                <div className='file_upload' style={{ display: "block" }}>
                                    <b>Format : </b> Name, Email and Mobile number<br /><br />
                                    <button className="upload" onClick={_this.bulk_upload.bind(_this)}>Upload</button>
                                    {/* <input type="file" className="upload_file" style={{display:"none"}} />
                                    <button className="upload_file2" onClick={(e)=>$(".upload_file").trigger('click') }>Choose file</button> */}
                                    <input type="file" id="real-file" style={{visibility:'hidden'}}/>
                                    <button type="button" id="custom-button">CHOOSE A FILE</button>
                                    <span id="custom-text">No file chosen, yet.</span>
                                    <br />
                                    <span className='progress'>-</span>
                                </div>
                            </div>
                            <div className="credentials_sect">
                                <form style={{ fontSize: "15px;" }}>
                                    <div style={{ marginBottom: "10px" }}>
                                        <div className='heading'>Send Credentials</div>
                                        <select id="cur_exam2" className="cur_exam2"></select>
                                        <button className="send" onClick={_this.send_password.bind(_this)}><b style={{ marginRight: "5px" }}><FaPlus style={{ color: "#FFFFFF" }} /> Send</b></button>
                                    </div>
                                    <b>Failed emails: </b><br />
                                    <pre className='refresh_status' id='refresh_status' ></pre>
                                    <pre id="email_status" className='email_status'></pre>

                                    <b>Email sent status: </b><br />
                                    <pre className='server_side_resp' id="server_side_resp"></pre>
                                </form>
                            </div>
                            {/* <div style={{ display: "none" }}><b>(*) Format: </b> Name,Email,Exam(Optional)
                            </div> */}
                        </div>
                    </div>
                </div>
            </div>
        </div>

    )
}
export default page;
