
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner'
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
                                <input className="form-control" id="myInput" type="text" placeholder="Search.."
                                    style={{ marginTop: "20px" }} />


                                <div className="table-responsive mob_overflow " id="lets_see">
                                    <table id="result" className="table table-bordered table-striped result" style={{ marginTop: "20px", borderCollapse: "collapse" }}>

                                    </table>
                                </div>


                            </div>
                            <input style={{ float: "right", display: "block" }} type="button" value="Download" onClick={_this.download_excel.bind(_this)} />
                            <input style={{ float: "right" }} type="button" value="Print" onClick={_this._print.bind(_this, "#result")} />
                            {/* <input style={{ float: "right" }} type="button" value="Download" onClick={_this.download_page.bind(_this)} /> */}
                            <input style={{ float: "right" }} type="button" value="Delete" className="del_user_btn_complete" />
                            <input style={{ float: "right", display: "none" }} type="button" value="Delete Result Set only" className="del_user_btn" />
                            {/* <input style={{ float: "right", display: "block" }} type="button" value="Download" onClick={_this.download_page.bind(_this)} /> */}
                            <a id="download" download="details.png" className="download" >Download</a>
                            {/* <a href="./details.xls">Download Excel sheet</a> */}
                        </div>

                    </div>
                </div>
            </div>
        </div>
    )
}
export default page;

