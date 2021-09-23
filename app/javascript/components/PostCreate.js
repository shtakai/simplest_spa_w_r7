import React, { useState, useContext } from 'react'
import { client } from '../utils/client'
import TokenContext from '../contexts/TokenContext'

const PostCreate = () => {
  const value = useContext(TokenContext)

  const [body, setBody] = useState('')

  const handlePost = async (e) => {
    e.preventDefault()
    try {
      const res = await client.post(
        '/posts',
        { post: { body }, authenticity_token: value }
      )
      console.log(res.data)
    } catch (err) {
      console.log({ err })
    }
  }

  return(
    <>
      <div>
        <h1>create Post component</h1>
        <div>
          <input
            type="text"
            value={body}
            onChange={ e => setBody(e.target.value) }
          />
          <button onClick={handlePost}>Create Post</button>
        </div>
      </div>

    </>
  )
}

export default PostCreate
