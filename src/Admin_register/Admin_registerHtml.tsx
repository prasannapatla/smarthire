
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';

var page = function (_this: any) {
    return (
        <div className="Admin_register">
            <div className="container">
                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        <Banner />
                        <div className="data">
                            <div className="sect">
                                <form style={{ fontSize: "15px;" }}>
                                    <div style={{ marginBottom: "10px" }}>
                                        <div className='heading'>Register Candidate</div>
                                        <input type="text" placeholder="Name" className="form-control rname" required />
                                        <input type="text" placeholder="Email" className="form-control remail" required />
                                        <select id="cur_exam" className="cur_exam" style={{marginTop: "10px"}}></select>
                                        <input type="button" onClick={_this.register_user.bind(_this)} value="Register" />
                                    </div>
                                </form>
                                <div className='file_upload' style={{ display: "block" }}>
                                <input type="file" className="upload_file"  />File type:xls,xlsx&nbsp;&nbsp;
                                    <button  onClick={_this.bulk_upload.bind(_this)}>Upload file</button>
                                    <b>Format: </b>Name,Email<br />
                                    <span className='progress'>-</span>
                                </div>
                            </div>
                            <div className="sect">
                                <form style={{ fontSize: "15px;" }}>
                                    <div style={{ marginBottom: "10px" }}>
                                        <div className='heading'>Send Credentials</div>
                                        <select id="cur_exam2" className="cur_exam2"></select>
                                        <input type="button" onClick={_this.send_password.bind(_this)} value="Send User Credentials" />
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
