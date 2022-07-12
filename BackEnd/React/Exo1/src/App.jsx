import {React, useState} from 'react';

const App = (props) => {

    const [nom, setNom] = useState("");

    const handleChangeNom = (evt) => {
        setNom(evt.target.value);
    }
    const [prenom, setPrenom] = useState("");

    const handleChangePrenom = (evt) => {
        setPrenom(evt.target.value);
    }
    return (
        <div>
            <div>
                Bonjour
                &nbsp;
                <span className='bolder'>
                    {nom}
                </span>
                &nbsp;
                <span className='bolder'> 
                    {prenom}
                </span>
            </div>
            <input type="text" placeholder="Nom:" value={nom} onChange={handleChangeNom}/>
            <input type="text" placeholder= "Prenom:" value={prenom} onChange={handleChangePrenom}/>
        </div>
    );
}

export { App };