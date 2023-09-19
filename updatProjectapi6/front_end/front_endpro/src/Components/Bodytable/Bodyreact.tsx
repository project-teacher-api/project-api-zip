import { useState } from "react";
import axios from 'axios';
import Table from 'react-bootstrap/Table';


function Poreport(){
    //var x=10;
    
    const [fdate, setfdate] = useState("");
    const [tdate, settodate] = useState("");

    const [reports,setReport]=useState([]);
    
    // const [person,setPerson]=useState([{id:1,name:'dara'},{id:2,name:'jon'}]);

    function Fsearch(){
        
        //alert(fdate);

        axios.post('http://127.0.0.1:8000/api/viewapi?fromdate=2023-08-01&todate=2023-08-01', {
            fromdate: fdate,
            todate: tdate
          })
          .then((response) => {
            //console.log(response);
            setReport(response.data);
          }, (error) => {
            console.log(error);
          });
        

    }
    return(
        <>
        
            <h3>My Report</h3>
            <form>
                From Date<input type="date" value={fdate} onChange={(e)=>setfdate(e.target.value)}/>
                To Date<input type="date" value={tdate} onChange={(e)=>settodate(e.target.value)}/>

                <button className="btn  btn-success" type="button" onClick={Fsearch}>Search</button>

            </form>
            <Table  bordered hover size="sm">
            <thead className="head-dark">
       
       <tr>
         
         <th style={{backgroundColor:'blue', color:'white'}}>id</th>
         <th style={{backgroundColor:'blue', color:'white'}}>po code</th>
         <th style={{backgroundColor:'blue', color:'white'}}>date</th>
         <th style={{backgroundColor:'blue', color:'white'}}>dis</th>
         <th style={{backgroundColor:'blue', color:'white'}}>tax</th>
         <th style={{backgroundColor:'blue', color:'white'}}>total</th>
       </tr>
     </thead>
     <tbody>
               {
              
               reports.map(
                       (report,key)=>                        
                       <tr key={key}>
                           <td>{report.poid}</td>
                           <td>{report.pocode}</td>
                           <td>{report.date}</td>
                           <td>{report.dis}</td>
                           <td>{report.tax}</td>
                           <td>{report.total}</td>                       
                       </tr>
                      
               )}
               
     </tbody>
                
   </Table>
                {
                    // person.map(
                    //     (p,key)=>
                    //         <li>{p.id}-{p.name}</li>
                    // )

                }
           
        </>
    )
}
export default Poreport;