
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import { FaPlus } from 'react-icons/fa';

var page = function (_this: any) {
    return (
        <div className="Admim_add_cat">
            <div className="container">

                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        <div className="data">
                            <div className="heading res" style={{ display: "none" }}>List of Questions from <span className='q_from' >value</span></div><br />
                            <button onClick={_this.back.bind(_this)} style={{ display: "none" }}>Back</button>
                            <button className="sel_all" style={{ display: "none", float: "right" }}>Select All</button>
                            <button className="del_que_btn" style={{ display: "none", float: "right" }}>Delete</button>
                            <table className='res q_list table result' style={{ display: "none" }}></table>
                            <button onClick={_this.back.bind(_this)} style={{ display: "none", float: "right" }}>Back</button>
                            <button className="sel_all" style={{ display: "none", float: "right" }}>Select All</button>


                            <div className="sect">
                                <div className='heading'>Add category</div>
                                <table style={{ width: "85%" }}>
                                    <tr>
                                        <td className="catName">
                                            <input type="text" className="form-control" id="cat_add" placeholder="ENTER A CATEGORY NAME" />
                                        </td>
                                        <td className="addBtn">
                                            <button onClick={_this.add.bind(_this)} id="add" ><FaPlus /> Add</button>
                                        </td>
                                        <td>
                                            {/* <button className="del_que_btn" style={{ display: "none", float: "right" }}>Delete</button> */}
                                        </td>
                                    </tr>
                                </table>
                                <table className="list_cat"></table>
                                <table>
                                    <tr>
                                        <td>
                                            <input type="button" value="Delete" className="del_cat_btn" /></td>
                                    </tr>    
                                </table>   
                            </div>
                            <br />
                            <br />
                            <div className="sect">
                                <div className='heading'>Create a new exam</div>
                                <div className="input_group">
                                    <table >
                                        <tr>
                                            <td>
                                                Exam name
                                        </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input className="examInfo" type="text" id="e_name" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table >
                                        <tr>
                                            <td>
                                                Start date
                                        </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input className="examInfo" type="text" id="datetimepicker" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table >
                                        <tr>
                                            <td>
                                                End date
                                        </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input className="examInfo" type="text" id="datetimepicker2" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table >
                                        <tr>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <button onClick={_this.add_exam.bind(_this)}><FaPlus /> Create
                                                </button>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <table className="list_exam"></table>
                                <table>
                                    <tr>
                                        {/* <td>
                                            <input type="button" value="Delete" className="del_exam_btn" />
                                        </td> */}
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div >
        </div >
    )
}
export default page;
