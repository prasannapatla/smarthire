
import React from 'react';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';
import { Link } from 'react-router-dom';
import { TiArrowUpThick } from "react-icons/ti";
import { AiTwotoneDelete } from "react-icons/ai";

var page = function (_this: any) {
    return (
        <div className="Admin_list_code_que">
            <div className="container">
                <div className="row" style={{ backgroundColor: '#F6F7FB' }}>
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        {/* <Banner /> */}
                        <div className="data">

                            <div className="sect">
                                <div className="page_header">
                                    <p className="exam_text">
                                        Coding Questions
                                    </p>
                                </div>
                                <button id="deleteCode" className="delete del_que_btn"><AiTwotoneDelete className="del_icon" />&nbsp; Delete</button>
                                {/* <input type="button" style={{ float: "right" }} value="Select all" className="sel_all" />  */}
                                <div className="table-responsive mob_overflow code _section">
                                    <div className="list_que" style={{ marginTop: "40px" }}>
                                    </div>
                                </div>
                                <a id="button"><TiArrowUpThick className="backTop" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default page;
