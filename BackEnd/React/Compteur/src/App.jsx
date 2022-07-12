import {React, useState} from 'react';

const App = (props) => {

    const [compteur,setCompteur] = useState(0);
   

    return (
        <div>
            <h1>vous avez cliqué {compteur} fois</h1>
         <button onClick={() => setCompteur(compteur +1)}>Click ici</button>
            
        </div>
    );
}

export { App };