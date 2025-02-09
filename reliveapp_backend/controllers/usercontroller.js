const { admin } = require('../utils/firebase');

const getUser = async (req, res) => {
  try {
    const userId = req.params.id;
    const user = await admin.firestore().collection('users').doc(userId).get();

    if (!user.exists) {
      return res.status(404).send({ message: 'User not found' });
    }

    res.send(user.data());
  } catch (error) {
    res.status(500).send({ message: 'Failed to fetch user', error: error.message });
  }
};

const createUser = async (req, res) => {
  try {
    const { id, name, email } = req.body;

    await admin.firestore().collection('users').doc(id).set({ name, email });
    res.status(201).send({ message: 'User created successfully' });
  } catch (error) {
    res.status(500).send({ message: 'Failed to create user', error: error.message });
  }
};

module.exports = { getUser, createUser };
