
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner'
import { FiPrinter, FiDownload } from 'react-icons/fi';
import { AiTwotoneDelete } from "react-icons/ai";


var page = function (_this: any) {
    return (
        <div className="Admin_view_result">
            <div className="container">
                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        {/* <Banner /> */}
                        <div className="data">
                            <div className="sect details">
                                <div className="headDetails">
                                    <div className='heading'>Results</div>
                                    <table className="sel_exam">
                                        <tr>
                                            <th className="select_exam_text">
                                                SELECT EXAM TYPE
                                        </th>
                                            <th className="select_entry_text">
                                                NO. OF ENTRIES
                                        </th>
                                        </tr>
                                        <tr className="select_exam_interact">
                                            <th>
                                                <select id='exam' className="exam"></select>
                                            </th>
                                            <th>
                                                <input type="number" defaultValue="10" placeholder="Intake" className="intake" />
                                            </th>
                                        </tr>
                                    </table>
                                </div>
                                <br /><br />
                                <div id="first_table">
                                    <table className="user_det" style={{ marginTop: "20px" }}>

                                    </table></div>
                                <div className="table-responsive mob_overflow " id="lets_see">
                                    <input className="form-control" id="myInput" type="text" placeholder="Search.."
                                        style={{ marginTop: "20px" }} />

                                    <button className="del delete del_user_btn_complete"><AiTwotoneDelete className="del_icon" />&nbsp; Delete</button>

                                    <button className="print" onClick={_this._print.bind(_this, "#result")}><FiPrinter className="icon" /> print
                                    </button>
                                    <button className="download" onClick={_this.download_excel.bind(_this)}><FiDownload className="icon" /> Download</button>

                                    <table id="result" className="table table-bordered table-striped result" style={{ marginTop: "20px", borderCollapse: "collapse" }}>

                                    </table>
                                </div>


                            </div>
                            <input type="button" value="Delete Result Set only" className="del_user_btn" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    )
}
export default page;

