import { useState } from 'react'
import '../node_modules/bootstrap/dist/js/bootstrap.bundle.js';
import 'bootstrap/dist/css/bootstrap.min.css';
import Container from 'react-bootstrap/Container';
import './App.css';
import Navbar from './Components/navbar/Navbar';
import Bodyreact from './Components/Bodytable/Bodyreact.js'; 
function App() {

  return (
    <Container>

    <Navbar />
    <Bodyreact />
   
    </Container>
  )
}

export default App
