const { admin } = require('../utils/firebase');

/**
 * Fetch all projects from Firestore
 */
const getAllProjects = async (req, res) => {
  try {
    const snapshot = await admin.firestore().collection('projects').get();
    const projects = snapshot.docs.map((doc) => ({
      id: doc.id,
      ...doc.data(),
    }));

    res.status(200).send(projects);
  } catch (error) {
    res.status(500).send({ message: 'Failed to fetch projects', error: error.message });
  }
};

/**
 * Add a new project to Firestore
 */
const createProject = async (req, res) => {
  try {
    const { name, description, status } = req.body;

    if (!name || !description) {
      return res.status(400).send({ message: 'Name and description are required' });
    }

    const newProject = {
      name,
      description,
      status: status || 'Pending',
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
    };

    const docRef = await admin.firestore().collection('projects').add(newProject);

    res.status(201).send({ message: 'Project created successfully', projectId: docRef.id });
  } catch (error) {
    res.status(500).send({ message: 'Failed to create project', error: error.message });
  }
};

/**
 * Update project by ID
 */
const updateProject = async (req, res) => {
  try {
    const { id } = req.params;
    const updatedData = req.body;

    const projectRef = admin.firestore().collection('projects').doc(id);
    const doc = await projectRef.get();

    if (!doc.exists) {
      return res.status(404).send({ message: 'Project not found' });
    }

    await projectRef.update(updatedData);

    res.status(200).send({ message: 'Project updated successfully' });
  } catch (error) {
    res.status(500).send({ message: 'Failed to update project', error: error.message });
  }
};

/**
 * Delete project by ID
 */
const deleteProject = async (req, res) => {
  try {
    const { id } = req.params;

    const projectRef = admin.firestore().collection('projects').doc(id);
    const doc = await projectRef.get();

    if (!doc.exists) {
      return res.status(404).send({ message: 'Project not found' });
    }

    await projectRef.delete();

    res.status(200).send({ message: 'Project deleted successfully' });
  } catch (error) {
    res.status(500).send({ message: 'Failed to delete project', error: error.message });
  }
};

module.exports = { getAllProjects, createProject, updateProject, deleteProject };
