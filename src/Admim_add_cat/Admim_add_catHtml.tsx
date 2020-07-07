
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import { FaPlus } from 'react-icons/fa';
import { AiTwotoneDelete } from "react-icons/ai";
import { TiArrowBack } from "react-icons/ti";
import { TiArrowUpThick } from "react-icons/ti";

var page = function (_this: any) {
    return (
        <div className="Admim_add_cat">
            <div className="container">

                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        <div className="data">
                            <button className="back" onClick={_this.back.bind(_this)} style={{ display: "none" }}><TiArrowBack className="del_icon"/> Back</button>
                            <div className="heading res" style={{ display: "none" }}>List of Questions from <span className='q_from' >value</span></div>
                            <button className="sel_all" style={{ display: "none", float: "right" }}>Select All</button>
                            <button className="del_que_btn" style={{ display: "none", float: "right" }}><AiTwotoneDelete className="del_icon" /> Delete</button>
                            <table className='res q_list table result' style={{ display: "none" }}></table>


                            <div className='heading' style={{fontSize:"20px"}}>Add category</div><br />
                            <div className="sect cate">
                                <table className="Add_cat" style={{ width: "85%" }}>
                                    <tr>
                                        <td className="catName">
                                            <input type="text" className="form-control" id="cat_add" style ={{width:'105%',fontSize:"12px"}} placeholder="Enter a Category Name" />
                                        </td>
                                        <td className="addBtn">
                                            <button onClick={_this.add.bind(_this)} id="add" ><FaPlus className="plus_icon"/> Add</button>
                                            <button className="del del_cat_btn delete"  ><AiTwotoneDelete className="del_icon" /> Delete</button>
                                        </td>
                                        {/* <td>
                                            </td> */}

                                    </tr>
                                </table>
                                <div className="list_cat_parent"></div>
                                <table>
                                    <tr>

                                    </tr>
                                </table>
                            </div>
                            <br />
                            <br />
                            <div className='heading' style={{fontSize:"20px"}}>Create a new exam</div><br />
                            <div className="sect exe">
                                <div className="input_group">
                                    <table className="exam_table1" >
                                        {/* <tr>
                                            <td className="exam_heading" style={{fontSize:"15px"}}><b>
                                                Exam name
                                                </b></td>
                                            <td className="exam_heading" style={{fontSize:"15px"}}><b>
                                                Start time
                                                </b></td>
                                            <td className="exam_heading" style={{fontSize:"15px"}}><b>
                                                End time
                                                </b></td>
                                        </tr> */}
                                        <tr>
                                            <td>
                                                <input className="examInfo" type="text" id="e_name" placeholder="Exam name"/>
                                            </td>
                                            <td>
                                                <input className="examInfo form-control custom_date s_date" type="text" id="datetimepicker" placeholder="Start time"/>
                                            </td>
                                            <td>
                                                <input className="examInfo form-control custom_date e_date" type="text" id="datetimepicker2" placeholder="End time"/>
                                            </td>
                                            <td>
                                                <button onClick={_this.add_exam.bind(_this)} className="create"><FaPlus className="plus_icon" /> Create
                                                </button>
                                                <button className="del_exam_btn delete_exam"><AiTwotoneDelete className="del_icon" /> Delete</button>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div className="list_exam_parent"></div>
                            </div>
                            <a id="button_up"><TiArrowUpThick className="backTop" /></a>
                        </div>
                    </div>
                </div>
            </div >
        </div >
    )
}
export default page;
