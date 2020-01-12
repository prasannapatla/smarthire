
import React from 'react';
import { Link } from 'react-router-dom';
import terraLogo from "../assets/Terralogic_Logo.png"
import { FaClock ,FaFileCode,FaUser,FaTelegramPlane,FaPowerOff} from 'react-icons/fa';
import {AiFillCode } from 'react-icons/ai';
import {TiGroup } from 'react-icons/ti';
import { IoIosPaper,IoIosJournal } from "react-icons/io";

var page = function (_this: any) {
    return (
        <div className="Admin_menu">
            <div className="menu_list">
                <div className="adm" style={{ textAlign: "center" }}>
                    <Link to='/admin_view_result'><img src={terraLogo} className="avatar" /><br /></Link>
                </div>
                <br/>
                <ul>
                    <li><Link to='/admin_view_result'><IoIosPaper/>&nbsp;&nbsp;&nbsp;View Results</Link></li>
                    <li><Link to='/admin_add_cat'><FaClock/>&nbsp;&nbsp;&nbsp;Add Categories &amp; Exams</Link></li>
                    <li><Link to='/admin'><FaTelegramPlane/>&nbsp;&nbsp;&nbsp;Add Questions</Link></li>
                    <li><Link to='/add_code'><AiFillCode/>&nbsp;&nbsp;&nbsp;Add Coding Problem Statement</Link></li>
                    <li><Link to='/admin_list_que'><FaUser/>&nbsp;&nbsp;&nbsp;Questions</Link></li>
                    <li><Link to='/admin_list_code_que'><FaTelegramPlane/>&nbsp;&nbsp;&nbsp;Coding Questions</Link></li>
                    <li><Link to='/admin_que_set'><FaFileCode/>&nbsp;&nbsp;&nbsp;Populate Exam</Link></li>
                    <li><Link to='/code_populate'><IoIosJournal/>&nbsp;&nbsp;&nbsp;Populate Coding Exam</Link></li>
                    <li><Link to='/admin_register'><FaUser/>&nbsp;&nbsp;&nbsp;Register Candidate</Link></li>
                    <li><Link to='/users'><TiGroup/>&nbsp;&nbsp;&nbsp;Admin users</Link></li>
                    {/* <br/> */}
                    <br/>
                    <li ><a href="javascript:void(0)" onClick={_this.user_logout.bind(_this)}><FaPowerOff/>&nbsp;&nbsp;&nbsp;Logout</a> </li>
                    <br/>
                </ul>
            </div>
        </div>
    )
}
export default page;
