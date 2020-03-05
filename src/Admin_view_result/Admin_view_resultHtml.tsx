
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner'
import { FiPrinter, FiDownload} from 'react-icons/fi';
import { FaSearch } from 'react-icons/fa';
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
                                            <th className="select_exam_text" style={{fontSize: "16px"}}>
                                                Select Exam Type
                                        </th>
                                            <th className="select_entry_text" style={{fontSize: "16px"}}>
                                                No. Of Entries
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
                                    <label className='testLabel'><FaSearch className="searchIcon"/>
                                        <input className="form-control inputLabel" id="myInput" type="text" placeholder="Search.."
                                            style={{ marginTop: "20px" }} />
                                    </label>
                                    <button className="print" onClick={_this._print.bind(_this, "#result")}><FiPrinter className="icon" /> print
                                    </button>
                                    <button className="download" onClick={_this.download_excel.bind(_this)}><FiDownload className="icon" /> Download</button>
                                    <button className="del delete del_user_btn_complete"><AiTwotoneDelete className="del_icon" />&nbsp; Delete</button>
                                    <table id="result" className="table  result" style={{ marginTop: "20px", borderCollapse: "collapse" }}>
                                    </table>
                                </div>
                            </div>
                            {/* <input type="button" value="Delete Result Set only" className="del_user_btn" /> */}
                        </div>

                    </div>
                </div>
            </div>
        </div>
    )
}
export default page;

