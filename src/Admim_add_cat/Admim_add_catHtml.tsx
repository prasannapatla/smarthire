
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
                            <div className="heading res" style={{ display: "none" }}>List of Questions from <span className='q_from' >value</span></div><br />
                            <button className="sel_all" style={{ display: "none", float: "right" }}>Select All</button>
                            <button className="del_que_btn" style={{ display: "none", float: "right" }}><AiTwotoneDelete className="del_icon" /> Delete</button>
                            <table className='res q_list table result' style={{ display: "none" }}></table>


                            <div className="sect cate">
                                <div className='heading'>Add category</div>
                                <table className="Add_cat" style={{ width: "85%" }}>
                                    <tr>
                                        <td className="catName">
                                            <input type="text" className="form-control" id="cat_add" style ={{width:'105%'}} placeholder="ENTER A CATEGORY NAME" />
                                        </td>
                                        <td className="addBtn">
                                            <button onClick={_this.add.bind(_this)} id="add" ><FaPlus /> Add</button>
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
                            <div className="sect">
                                <div className='heading'>Create a new exam</div>
                                <div className="input_group">
                                    <table className="exam_table1" >
                                        <tr>
                                            <td className="exam_heading">
                                                Exam name
                                        </td>
                                            <td className="exam_heading">
                                                Start date
                                        </td>
                                            <td className="exam_heading">
                                                End date
                                        </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input className="examInfo" type="text" id="e_name" />
                                            </td>
                                            <td>
                                                <input className="examInfo form-control custom_date s_date" type="text" id="datetimepicker" />
                                            </td>
                                            <td>
                                                <input className="examInfo form-control custom_date e_date" type="text" id="datetimepicker2" />
                                            </td>
                                            <td>
                                                <button onClick={_this.add_exam.bind(_this)} className="create"><FaPlus /> Create
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
