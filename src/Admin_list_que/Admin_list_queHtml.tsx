
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';
import { TiArrowUpThick } from "react-icons/ti";
import { AiTwotoneDelete } from "react-icons/ai";

var page = function (_this: any) {
    return (
        <div className="Admin_list_que">
            <div className="container">
                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        {/* <Banner /> */}
                        {/* <div className="data"> */}
                        <div className='page_header'>
                            <p className='que_text'>
                                Questions
                            </p>
                            <div className='exam_type'>
                                <p className='type_text'>SELECT EXAM TYPE.</p>
                                <select id="cat"></select>
                            </div>
                        </div>
                        <div>
                            <button className="delete del_que_btn"><AiTwotoneDelete className="del_icon"/>&nbsp; Delete</button>
                        </div>
                        {/* <input type="button" style={{ float: "right" }} value="Delete" className="del_que_btn" />
                            <input type="button" style={{ float: "right" }} value="Select all" className="sel_all" /> */}
                        <div className="sect">
                            {/* <br /><br /><br /> */}
                            <div className="table-responsive mob_overflow quest">
                                <table className="list_que table result" style={{ marginTop: "20px;" }}>
                                </table>
                            </div>
                            <a id="button"><TiArrowUpThick className="backTop" /></a>
                            {/* <input type="button" style={{ float: "right" }} value="Delete" className="del_que_btn" />
                                <input type="button" style={{ float: "right" }} value="Select all" className="sel_all" /> */}
                        </div>
                    </div>
                    {/* </div> */}
                </div>
            </div>
        </div>
    )
}
export default page;
