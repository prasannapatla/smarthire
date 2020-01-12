
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';

var page = function (_this: any) {
   return (
      <div className="Users">
         <div className="container">
            <div className="row">
               <Admin_menu />
               <div className="col-sm-9 content">
                  <Banner />
                  <div className="data">
                     <div className="sect">
                        <table>
                           <thead>
                              <tr>
                                 <th>Name</th>
                                 <th>Email id</th>
                                 <th>password</th>
                                 <th>Full previlige</th>
                                 <th>Mark for remove user</th>
                              </tr>
                           </thead>
                           <tbody className="user_data">
                           </tbody>
                        </table>
                        <input type="button" value="Delete" className="delete" onClick={_this.del_user.bind(_this)} />
                        <span className='update_status'></span>
                        <form onSubmit={_this.add.bind(_this)} className="add_user">
                           <input type="text" placeholder="name" className="name" required />
                           <input type="email" placeholder="email" className="email" required />
                           <input type="password" maxLength={6} placeholder="password" className="password" required />
                           <label>As super admin <input type="checkbox" className="admin" /></label>
                           <input type="submit" value="Add user" />&nbsp;&nbsp;&nbsp;
                                    <input type="reset" className="clear" value='Clear fields' />
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
