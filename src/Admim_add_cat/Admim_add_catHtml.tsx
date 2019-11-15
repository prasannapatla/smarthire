
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';



var page = function (_this: any) {
    return (
        <div className="Admim_add_cat">
            <div className="container">

                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        <Banner />
                        <div className="data">
                            <div className="heading res" style={{ display: "none" }}>List of Questions from <span className='q_from' >value</span></div><br />
                            <button onClick={_this.back.bind(_this)} style={{ display: "none" }}>Back</button>
                            <button className="sel_all" style={{ display: "none", float: "right" }}>Select All</button>
                            <button className="del_que_btn" style={{ display: "none", float: "right" }}>Delete</button>
                            <table className='res q_list table result' style={{ display: "none" }}></table>
                            <button onClick={_this.back.bind(_this)} style={{ display: "none", float: "right" }}>Back</button>
                            <button className="sel_all" style={{ display: "none", float: "right" }}>Select All</button>
                            <button className="del_que_btn" style={{ display: "none", float: "right" }}>Delete</button>

                            <div className="sect">
                                <div className='heading'>Add category</div>
                                <table style={{ width: "85%" }}>
                                    <tr>
                                        <td>
                                            <input type="text" className="form-control" id="cat_add" />
                                        </td>
                                        <td>
                                            <input type="button" onClick={_this.add.bind(_this)} value="Add category" id="add" style={{
                                                marginLeft: "-12px"
                                            }} />
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
                                                <input type="text" className="form-control" id="e_name" />
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
                                                <input className="form-control custom_date s_date" type="text" id="datetimepicker" />
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
                                                <input className="form-control custom_date e_date" type="text" id="datetimepicker2" />
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
                                                <input type="button" value="Create" onClick={_this.add_exam.bind(_this)} />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <table className="list_exam"></table>
                                <table>
                                    <tr>
                                        <td>
                                            <input type="button" value="Delete" className="del_exam_btn" />
                                        </td>
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
