
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
                                <input type="button" value="update" className="update" onClick={_this.update.bind(_this)} />


                                <form onSubmit={_this.add.bind(_this)} className="add_user">
                                    <input type="text" placeholder="name" className="name" />
                                    <input type="email" placeholder="email" className="email" />
                                    <input type="password" placeholder="password" className="password" />
                                    <label>As super admin <input type="checkbox" className="admin" /></label>
                                    <input type="submit"  className="Add" />&nbsp;&nbsp;&nbsp;
                                    <input type="reset"  className="clear" />
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
    