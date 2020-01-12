
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';
import { TiArrowUpThick } from "react-icons/ti";
import { AiTwotoneDelete } from "react-icons/ai";

var page = function (_this: any) {
   return (
      <div className="Users">
         <div className="container">
            <div className="row">
               <Admin_menu />
               <div className="col-sm-9 content">
                  {/* <Banner /> */}
                  <div className="data">
                     <div className="sect">
                     <div className="page_header">
                                    <p className="exam_text">
                                       Admin Users
                                    </p>
                                </div>
                                <button id="deleteCode" className="delete del_que_btn"><AiTwotoneDelete className="del_icon" onClick={_this.del_user.bind(_this)} />&nbsp; Delete</button>
                                {/* <input type="button" value="Delete" className="delete" onClick={_this.del_user.bind(_this)} /> */}
                        <table style={{ marginTop: "100px",marginLeft:"50px" }}>
                           <thead>
                              <tr>
                                 <th>Name&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                 <th>Email id&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                 <th>password&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                 <th>Full previlige&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                 <th>Mark for remove user&nbsp;&nbsp;&nbsp;&nbsp;</th>
                              </tr>
                           </thead>
                           <tbody className="user_data">
                           </tbody>
                        </table>
                        <br/><br/>
                        <span className='update_status'></span>
                        <form onSubmit={_this.add.bind(_this)} className="add_user" style={{ marginTop: "50px"}}>
                           &nbsp;&nbsp;&nbsp;<input type="text" placeholder="name" className="name" required style={{ width: "300px" }}/><br/>
                           &nbsp;&nbsp;&nbsp;<input type="email" placeholder="email" className="email" required style={{ width: "300px" }}/><br/>
                           &nbsp;&nbsp;&nbsp;<input type="password" maxLength={6} placeholder="password" className="password" required style={{ width: "300px" }}/><br/>
                           &nbsp;&nbsp;&nbsp;<label>As super admin&nbsp;&nbsp;&nbsp; <label className='container1'><input type="checkbox" className="admin full" /><span className='checkmark' style={{position: "absolute",left: "100%", top: "-20px"}}></span></label></label>&nbsp;&nbsp;&nbsp;<input type="submit" value="Add user" style={{marginLeft:"30px"}}/>&nbsp;&nbsp;&nbsp;<input type="reset" className="clear" value='Clear fields' />
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   )
}
export default page;
