import React from 'react'
import ReactDOM from 'react-dom'
import TsApp from './TsApp'
import Login from './Login'
import Ping from './Ping'
import Logout from './Logout'
import Posts from './Posts'
import Post from './Post'
import PostCreate from './PostCreate'
import TokenContext from '../contexts/TokenContext'

const App = () => {
  const authenticity_token = document.getElementsByName('csrf-token')[0].content
  console.log({ authenticity_token })

  return(
    <TokenContext.Provider value={authenticity_token}>
      <h1>Alyson here I am. Fuck off!</h1 >
      <TsApp />
      <Login />
      <Ping />
      <Posts />
      <Post />
      <PostCreate />
      <Logout />
    </TokenContext.Provider>
  )
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
)
