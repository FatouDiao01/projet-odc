
import axios from "axios";

const axiosInstance = axios.create({
    baseURL: "http://backend-service:8080/api/",  // <-- DNS interne Kubernetes
});

export const UseAxios = () => {
  const token = localStorage.getItem("token"); 
  console.log(token);
  axiosInstance.interceptors.request.use(
    (config) => {
      if (token) {
        config.headers.Authorization = `Bearer ${token}`;
      }
      return config;
    },
    (error) => Promise.reject(error)
  );

  return{ axiosInstance}
};
