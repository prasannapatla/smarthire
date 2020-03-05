
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
            <div className="row" style={{ backgroundColor: "#F6F7FB" }}>
               <Admin_menu />
               <div className="col-sm-9 content">
                  {/* <Banner /> */}
                  <div className="data">
                     <div className="page_header">
                        <p className="exam_text">
                           Admin Users
                           </p>
                     </div>
                     <div className="sect">
                        <div className="body_header">
                           <p className="details_text" style={{ fontSize: '18px'}}>
                              Details
                           </p>
                        </div>
                        <button id="deleteCode" className="delete del_que_btn" onClick={_this.del_user.bind(_this)}><AiTwotoneDelete className="del_icon" />&nbsp; Delete</button>
                        <table>
                           <thead>
                              <tr>
                                 <th style={{ borderBottom: "solid 1px #d0d0d0", paddingBottom: "8px",fontSize: '16px' }}>Name&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                 <th style={{ borderBottom: "solid 1px #d0d0d0", paddingBottom: "8px",fontSize: '16px' }}>Email id&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                 <th style={{ borderBottom: "solid 1px #d0d0d0", paddingBottom: "8px",fontSize: '16px' }}>Password&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                 <th style={{ paddingLeft: "16px", borderBottom: "solid 1px #d0d0d0", paddingBottom: "8px" }}>Full previlige&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                 <th style={{ borderBottom: "solid 1px #d0d0d0", paddingBottom: "8px", fontSize: '16px'}}>Select to delete user&nbsp;&nbsp;&nbsp;&nbsp;</th>
                              </tr>
                           </thead>
                           <tbody className="user_data">
                           </tbody>
                        </table>
                     </div>
                     <br/>
                     <div className="sect">
                     <div className="body_header" style={{height:"unset"}}>
                           <p className="details_text" style={{width:"unset",fontSize: '18px'}}>
                              Add Users
                           </p>
                        </div>
                        <form onSubmit={_this.add.bind(_this)} className="add_user" >
                           <input type="text" placeholder="Name" className="name" required style={{ width: "300px",fontSize: '15px'} } /><br />
                           <input type="email" placeholder="Email" className="email" required style={{ width: "300px",fontSize: '15px'} } /><br />
                           <input type="password" maxLength={6} placeholder="Password" className="password" required style={{ width: "300px",fontSize: '15px'} } /><br />
                           <label><b style={{fontSize: '16px'}} >As super admin&nbsp;&nbsp;&nbsp;</b> <label className='container1'><input type="checkbox" className="admin full" /><span className='checkmark' style={{ position: "absolute", left: "100%", top: "-20px" }}></span></label></label>&nbsp;&nbsp;&nbsp;<input type="submit" value="Add user" style={{ marginLeft: "30px" }} />&nbsp;&nbsp;&nbsp;<input type="reset" className="clear" value='Clear fields' />
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
