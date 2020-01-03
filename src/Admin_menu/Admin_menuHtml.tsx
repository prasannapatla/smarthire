
import React from 'react';
import { Link } from 'react-router-dom';
import terraLogo from "../assets/Terralogic_Logo.png"
import { FaClock ,FaFileCode,FaUser,FaTelegramPlane,FaPowerOff} from 'react-icons/fa';
import {AiFillCode } from 'react-icons/ai';
import {TiGroup } from 'react-icons/ti';

var page = function (_this: any) {
    return (
        <div className="Admin_menu">
            <div className="menu_list">
                <div className="adm" style={{ textAlign: "center" }}>
                    <Link to='/admin_view_result'><img src={terraLogo} className="avatar" /><br /></Link>
                </div>
                <br/>
                <ul>
                    <li><Link to='/admin_view_result'>View Results</Link></li>
                    <li><Link to='/admin_add_cat'><FaClock/> Add Categories &amp; Exams</Link></li>
                    <li><Link to='/admin'><FaTelegramPlane/> Add Questions</Link></li>
                    <li><Link to='/add_code'><AiFillCode/> Add Coding Problem Statement</Link></li>
                    <li><Link to='/admin_list_que'><FaUser/> Questions</Link></li>
                    <li><Link to='/admin_list_code_que'><FaTelegramPlane/> Coding Questions</Link></li>
                    <li><Link to='/admin_que_set'><FaFileCode/> Populate Exam</Link></li>
                    <li><Link to='/code_populate'>Populate Coding Exam</Link></li>
                    <li><Link to='/admin_register'><FaUser/> Register Candidate</Link></li>
                    <li><Link to='/users'><TiGroup/> Admin users</Link></li>
                    {/* <br/> */}
                    <br/>
                    <li ><a href="javascript:void(0)" onClick={_this.user_logout.bind(_this)}><FaPowerOff/> Logout</a> </li>
                    <br/>
                </ul>
            </div>
        </div>
    )
}
export default page;
