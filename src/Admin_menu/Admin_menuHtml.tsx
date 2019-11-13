
import React from 'react';
import { Link } from 'react-router-dom';
import logo from '../assets/terralogo.svg';

var page = function (_this: any) {
    return (
        <div className="Admin_menu col-sm-3 menu">
            <div className="menu_list">
                <div className="adm" style={{ textAlign: "center" }}>
                    <Link to='/admin_view_result'><img src={logo} className="avatar" /><br /></Link>
                    Control Panel
                <hr />
                </div>
                <ul>
                    <li><Link to='/admin_view_result'>View Results</Link></li>
                    <li><Link to='/admin_add_cat'>Add Categories &amp; Exams</Link></li>
                    <li><Link to='/admin'>Add Questions</Link></li>
                    <li><Link to='/add_code'>Add Coding Problem Statement</Link></li>
                    <li><Link to='/admin_list_que'>View Questions</Link></li>
                    <li><Link to='/admin_list_code_que'>View coding Questions</Link></li>
                    <li><Link to='/admin_que_set'>Populate Exam</Link></li>
                    <li><Link to='/code_populate'>Populate Coding Exam</Link></li>
                    <li><Link to='/admin_register'>Register Candidate</Link></li>
                    <li><Link to='/users'>Admin users</Link></li>
                    <li ><a href="javascript:void(0)" onClick={_this.user_logout.bind(_this)}>Logout</a> </li>
                </ul>
            </div>
        </div>
    )
}
export default page;
