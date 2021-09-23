import React, { useState } from 'react'
import { client } from '../utils/client'

const Logout = () => {
  const handleLogout = async (e) => {
    e.preventDefault()
    try {
      const res = await client.delete(
        '/logout',
      )
      console.log(res.data)
    } catch (err) {
      console.log({ err })
    }
  }

  return(
    <>
      <div>
        <h1>Logout component</h1>
        <div>
          <button onClick={handleLogout}>Logout</button>
        </div>
      </div>

    </>
  )
}

export default Logout
