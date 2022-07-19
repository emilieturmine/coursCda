import {React, useState} from 'react';

const App = (props) => {
    const [nom,setNom] = useState(["soda","salade","chaussures"]);
    const [qte,setQte] = useState([2 ,1,1]);
    const [ajout, setAjout] = useState("")

    const handleChangeNom = (evt) => {
        setAjout(evt.target.value);
    }
    const handleSubmit = (e) => {
        e.preventDefault();

        const nomCopy = [...nom];

        nomCopy.push(ajout);

        setNom(nomCopy);

    }
   
     return (
            <div>
                <h1>Liste de courses</h1>
          
                    <ul> 
                    <span className='bolder'>
                    {nom.map((nom) => (
                        <li key={nom}>
                            {nom}
                        </li>
                    ))
                    }
                </span>
                    </ul>
                    <form onSubmit={handleSubmit}>
                        <input type="text"  value={ajout} onChange={handleChangeNom} placeholder="Ajouter un élément"></input>
                        <button>Ajouter</button>
                    </form>
            </div>);
        }
     
        // ReactDOM.render(
        //     <NumberList numbers={numbers} />,
        //     document.getElementById('App')
        //     );

 export { App };

