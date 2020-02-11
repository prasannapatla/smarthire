
/* /// <reference types="anychart" /> */
import React from 'react';
import ReactDOM from 'react-dom'
import ReactMinimalPieChart from 'react-minimal-pie-chart';
import { FiPrinter, FiDownload } from 'react-icons/fi';
// @ts-ignore
import AnyChart from "anychart-react/dist/anychart-react"
// import  "anychart"

var page = function (_this: any) {

    let pi_grap_str: any = []
    let orig_json = _this.state.orig_json
    for (let row in orig_json) {
        let temp = [["Correct", orig_json[row].correct], ["wrong", orig_json[row].wrong]]
        pi_grap_str.push(<span><AnyChart
            id="pieChart1"
            width={300}
            height={200}
            type="pie"
            data={temp}
            title={orig_json[row].category}
        /></span>)
    }
    return (
        <div className="Admin_detail_res">
            <div className="container" style={{ backgroundColor: "#fafafa" }}>
                <div id="selected">
                    <input className="down" type="button" value="Print" onClick={_this.print_page.bind(_this)} />
                    <div className='screenshot' style={{display:"none"}} id='screenshot'></div>
                    <a id="download" download="details.png" className="download"><FiDownload className="icon" /> Download</a>
                    <div className="sect" style={{ display: "none" }}>
                        <table className="filter">
                            <tbody>
                                <tr>
                                    <th>
                                        Where
                                    </th>
                                    <td>
                                        <label>
                                            <input type="checkbox" defaultValue="strict" className="strict" onClick={_this.myfilter.bind(_this)}
                                                defaultChecked={true} />Strict match
                                        </label>
                                        <input type="text" defaultValue="" className="where"
                                            placeholder="cond1=val1,cond2=val2,... conD=valN  (Example: user=user@gmail.com,score>=35)"
                                            onKeyUp={_this.myfilter.bind(_this)} />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        Group by
                                    </th>
                                    <td>
                                        <input type="text" defaultValue="" className="group"
                                            placeholder="group1 group2 .... groupN (Example: que cat)" onKeyUp={_this.myfilter.bind(_this)} />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        Having
                                    </th>
                                    <td>
                                        <select className="agg">
                                            <option defaultValue="count">Count</option>
                                            <option selected defaultValue="sum">Sum</option>
                                            <option defaultValue="max">Max</option>
                                            <option defaultValue="min">Min</option>
                                            <option defaultValue="avg">Average</option>
                                        </select>
                                        <input type="text" defaultValue="" className="having" placeholder="group<val Ex:score>35"
                                            onKeyUp={_this.myfilter.bind(_this)} />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        Order by
                                    </th>
                                    <td>
                                        <input type="text" defaultValue="" className="order"
                                            placeholder="order1,order2 desc,order3,order4,.... orderN/orderN desc (Example: user,score desc)"
                                            onKeyUp={_this.myfilter.bind(_this)} />
                                    </td>
                                </tr>
                                <tr className="del_btns">
                                    <td colSpan={2}>
                                        <input type="button" defaultValue="delete result set" onClick={_this.del_user.bind(_this, 1)} />
                                        <input type="button" defaultValue="delete result set and user" onClick={_this.del_user.bind(_this, 2)} />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div className="content">
                        <div className="sect">
                            <div className="table-responsive mob_overflow">
                                <table className="table user_det">
                                </table>
                            </div>
                        </div>

                        <div className="sect allchart" >
                            <div className="pichart" >
                                {pi_grap_str}
                            </div>
                            <div className="chart mob_overflow">

                                {/* <ReactMinimalPieChart
                                data={_this.state.pi_json}
                                label
                                labelStyle={{
                                    fontSize: '5px',
                                    fontFamily: 'sans-serif'
                                }}
                                radius={30}
                                labelPosition={112}
                                animate
                                onClick={_this.test.bind()}
                            /> */}
                                <div className="chart1 ">

                                    <AnyChart
                                        id="pieChart2"
                                        width={400}
                                        height={300}
                                        type="pie"
                                        data={_this.state.pi_json}
                                        title="Time taken for each Category(Sec)"
                                    />
                                    {/* <canvas id="PiChart" width="400" height="400"></canvas> */}

                                </div>
                                <div className="chart2">

                                    {/* <AnyChart id="pieChart3" data={_this.state.bar_json} type="column" title="Category wise correct answer" width={400} height={300} legend={true} /> */}
                                    <canvas id="myChart" width="400" height="400"></canvas>

                                </div>
                            </div>
                        </div>

                        <h3>MCQ Results</h3>
                        <div className="sect">
                            <div className="table-responsive mob_overflow">
                                <table id="result" className="table">

                                </table>
                            </div>
                        </div>

                        <h3>Coding Results</h3>
                        <div className="sect">
                            <div className="table-responsive mob_overflow">
                                <table id="code_result" className="table code_result">

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default page;
