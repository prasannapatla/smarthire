
import React from 'react';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';
import { Link } from 'react-router-dom';

var page = function (_this: any) {
    return (
        <div className="Admin_list_code_que">
            <div className="container">
                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        <Banner />
                        <div className="data">
                            <div className="sect">
                                <div className='heading'>View Questions</div>

                                <input type="button" style={{ float: "right" }} value="Delete" className="del_que_btn" />
                                <input type="button" style={{ float: "right" }} value="Select all" className="sel_all" />
                                <div className="table-responsive mob_overflow">
                                    <div className="list_que" style={{ marginTop: "20px" }}>
                                    </div>
                                </div>
                                <input type="button" style={{ float: "right" }} value="Delete" className="del_que_btn" />
                                <input type="button" style={{ float: "right" }} value="Select all" className="sel_all" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default page;
    