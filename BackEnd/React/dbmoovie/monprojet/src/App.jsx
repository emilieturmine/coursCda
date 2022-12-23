import {React, useState} from 'react';

const App = (props) => {

    const [liste, setListe] = useState(["toto", "titi"])
    const [element, setElement] = useState("")

    const handleChangeElement = (evt) => {
        setElement(evt.target.value);
    }

    const handleClick = () => {
        fetch("http://api.themoviedb.org/3/search/movie?api_key=f33cd318f5135dba306176c13104506a&query=" + element)
        .then( (response) => {
            return response.json(); // pour consommer des données au format json
        })
        .then( (data) => {
            console.log(data);
            setListe(data.results)
        })
        .catch(function (error) {
            console.log(error);
        }); 
        
    }

    console.log("render App...")

    return (
        <div >
             <input type="text" value={element} onChange={handleChangeElement}/>
            <button onClick={handleClick}>Rechercher</button>
            {
                liste.map( (element, index) => {
                    return (
                        <div key={index}>
                           
                            <img src={"http://image.tmdb.org/t/p/w185" + element.poster_path} />
                            {element.title}
                        </div>
                    )
                })
            }
           
        </div>
    );
}

export { App };