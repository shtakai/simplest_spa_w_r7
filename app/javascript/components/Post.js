import React, { useState } from 'react'
import { client } from '../utils/client'

const Post = () => {
  const [id, setId] = useState('')

  const handlePost = async (e) => {
    e.preventDefault()
    try {
      const res = await client.get(
        `/posts/${id}`,
      )
      console.log(res.data)
    } catch (err) {
      console.log({ err })
    }
  }

  return(
    <>
      <div>
        <h1>get Post component</h1>
        <div>
          <input
            type="text"
            value={id}
            onChange={ e => setId(e.target.value) }
          />
          <button onClick={handlePost}>Post</button>
        </div>
      </div>

    </>
  )
}

export default Post
