/**
 * Middleware to handle application-wide errors
 */
const errorHandler = (err, req, res, next) => {
  console.error(err.stack);

  const statusCode = err.statusCode || 500;
  const message = err.message || 'Internal Server Error';

  res.status(statusCode).send({
    error: {
      message,
      details: err.details || null,
    },
  });
};

module.exports = (err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ error: 'Internal Server Error' });
};
