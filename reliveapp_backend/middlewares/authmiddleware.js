const { admin } = require('../utils/firebase');

const verifyToken = async (req, res, next) => {
  const token = req.headers.authorization;

  if (!token) {
    return res.status(403).send({ message: 'No token provided' });
  }

  try {
    const decodedToken = await admin.auth().verifyIdToken(token);
    req.user = decodedToken;
    next();
  } catch (error) {
    res.status(401).send({ message: 'Unauthorized', error: error.message });
  }
};

module.exports = { verifyToken };
