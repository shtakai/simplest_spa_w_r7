import React, { useState } from 'react'
import { client } from '../utils/client'

const Ping = () => {
  const handlePing = async (e) => {
    e.preventDefault()
    try {
      const res = await client.get(
        '/ping',
      )
      console.log(res.data)
    } catch (err) {
      console.log({ err })
    }
  }

  const handlePinga = async (e) => {
    e.preventDefault()
    try {
      const res = await client.get(
        '/pinga',
      )
      console.log(res.data)
    } catch (err) {
      console.log({ err })
    }
  }

  return(
    <>
      <div>
        <h1>Ping Component</h1>
        <div>
          <button onClick={handlePing}>Ping</button>
        </div>
        <div>
          <button onClick={handlePinga}>Ping w/ authentication</button>
        </div>
      </div>

    </>
  )
}

export default Ping
