import React, { useState, useContext } from 'react'
import { client } from '../utils/client'
import TokenContext from '../contexts/TokenContext'

const Login = () => {
  const value = useContext(TokenContext)

  const [name, setName] = useState('')
  const [password, setPassword] = useState('')

  const handleLogin = async (e) => {
    e.preventDefault()
    console.log({ name })
    console.log({ password })
    try {
      const res = await client.post(
        '/login',
        { name, password, authenticity_token: value }
      )
      console.log(res.data)
    } catch (err) {
      console.log({ err })
    }

  }

  return(
    <>
      <div>
        <h3>token: {value}></h3>
        <h1>Login component</h1>
        <div>
          <input
            className="border-4 border-light-blue-500 border-opacity-100"
            type="text"
            value={name}
            onChange={ e => setName(e.target.value) }
          />
          <input
            className="border-4 border-light-blue-500 border-opacity-100"
            type="password"
            value={password}
            onChange={ e => setPassword(e.target.value) }
          />
          <button onClick={handleLogin}>login</button>
        </div>
      </div>

    </>
  )
}

export default Login
