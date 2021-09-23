import React, { useState } from 'react'
import { client } from '../utils/client'

const Posts = () => {
  const handlePosts = async (e) => {
    e.preventDefault()
    try {
      const res = await client.get(
        '/posts',
      )
      console.log(res.data)
    } catch (err) {
      console.log({ err })
    }
  }

  return(
    <>
      <div>
        <h1>Posts Component</h1>
        <div>
          <button onClick={handlePosts}>Posts</button>
        </div>
      </div>

    </>
  )
}

export default Posts
