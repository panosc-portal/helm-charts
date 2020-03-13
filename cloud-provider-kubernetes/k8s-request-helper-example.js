const getVolumes = function(image, user) {
  const volumes = [
    {
      name: 'home',
      volume: {
        hostPath: {
          path: user.homePath,
          type: 'Directory'
        }
      }
    },
    {
      name: 'volume2',
      data: {
        hostPath: {
          path: process.env.PATH,
          type: 'Directory'
        }
      }
    }
  ];

  const volumeNames = image.volumes ? image.volumes.map(volume => volume.name) : [];
  return volumes.filter(volume => volumeNames.includes(volume.name));
};

const getEnvVars = function(image, user) {
  const allEnvVars = [
    {
      imageName: 'jupyter',
      data: [
        { name: 'NB_UID', value: `${user.uid}` },
        { name: 'NB_GID', value: `${user.gid}` }
      ]
    },{
      imageName: 'ubuntu',
      data: [
        { name: 'NB_UID', value: `${user.uid}` },
        { name: 'NB_GID', value: `${user.gid}` }
      ]
    }
  ];

  const envVars = allEnvVars.find(envVars => envVars.imageName === image.name);
  return envVars == null ? null : envVars.data;
};

module.exports = {
  getVolumes: getVolumes,
  getEnvVars: getEnvVars
};